//
//  SelfIntroductionView.swift
//  SelfIntroduction
//
//  Created by Haruto Fukumoto on 2026/04/27.
//

import SwiftUI

struct SelfIntroductionView: View {
    var body: some View {
        ZStack {
                    VStack(spacing: 22) {

                        VStack(alignment: .leading, spacing: 4) {
                            Text("自己紹介")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top)
                            Text("Self Introduction")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)

                        VStack {
                            HStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110, height: 110)
                                    .foregroundColor(.blue)
                                    .padding()

                                VStack{
                                    Text("福本 陽翔")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text("徳山高校\n九州産業大学")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                }
                            }

                            

                            Text("よろしくお願いします!!!!!!")
                                .font(.body)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.accent)
                                .cornerRadius(18)
                        }
                        .padding(24)
                        .background(Color.white)
                        .cornerRadius(28)
                        .shadow(color: .black.opacity(0.08), radius: 16, x: 0, y: 6)

                        HStack(spacing: 16) {
                            VStack(spacing: 12) {
                                Image("icon_game")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.accent)

                                Text("趣味")
                                    .font(.headline)
                                    .fontWeight(.bold)

                                Text("ゲーム\n音楽")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color.white)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 4)

                            VStack(spacing: 12) {
                                Image("icon_book")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.blue)

                                Text("マイブーム")
                                    .font(.headline)
                                    .fixedSize(horizontal: true, vertical: false)
                                
                                Text("温泉, サウナ")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color.white)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 4)
                            
                            VStack(spacing: 12) {
                                Image("icon_code")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.purple)

                                Text("スキル")
                                    .font(.headline)
                                    .fontWeight(.bold)

                                Text("Java,Python,HTML,Swift...")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(Color.white)
                            .cornerRadius(24)
                            .shadow(color: .black.opacity(0.07), radius: 8, x: 0, y: 4)
                        }

                        VStack() {
                            HStack {
                                Image("icon_target")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.purple)
                                
                                Text("今後の目標")
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }

                            Text("自分が満足できるまでアプリを作り続けれるエンジニアになる")
                                .font(.body)
                                .lineSpacing(6)
                                .foregroundColor(.black.opacity(0.8))
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(22)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(24)
                        .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 5)

                        Spacer()
                    }
                    .padding(24)
                }
    }
}
