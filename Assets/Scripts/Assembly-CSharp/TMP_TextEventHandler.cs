using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

namespace TMPro
{
	// Token: 0x0200003C RID: 60
	public class TMP_TextEventHandler : MonoBehaviour, IPointerEnterHandler, IEventSystemHandler, IPointerExitHandler
	{
		// Token: 0x17000006 RID: 6
		// (get) Token: 0x060000F5 RID: 245 RVA: 0x00004CC0 File Offset: 0x00002EC0
		// (set) Token: 0x060000F6 RID: 246 RVA: 0x00004CC8 File Offset: 0x00002EC8
		public TMP_TextEventHandler.CharacterSelectionEvent onCharacterSelection
		{
			get
			{
				return this.m_OnCharacterSelection;
			}
			set
			{
				this.m_OnCharacterSelection = value;
			}
		}

		// Token: 0x17000007 RID: 7
		// (get) Token: 0x060000F7 RID: 247 RVA: 0x00004CD1 File Offset: 0x00002ED1
		// (set) Token: 0x060000F8 RID: 248 RVA: 0x00004CD9 File Offset: 0x00002ED9
		public TMP_TextEventHandler.SpriteSelectionEvent onSpriteSelection
		{
			get
			{
				return this.m_OnSpriteSelection;
			}
			set
			{
				this.m_OnSpriteSelection = value;
			}
		}

		// Token: 0x17000008 RID: 8
		// (get) Token: 0x060000F9 RID: 249 RVA: 0x00004CE2 File Offset: 0x00002EE2
		// (set) Token: 0x060000FA RID: 250 RVA: 0x00004CEA File Offset: 0x00002EEA
		public TMP_TextEventHandler.WordSelectionEvent onWordSelection
		{
			get
			{
				return this.m_OnWordSelection;
			}
			set
			{
				this.m_OnWordSelection = value;
			}
		}

		// Token: 0x17000009 RID: 9
		// (get) Token: 0x060000FB RID: 251 RVA: 0x00004CF3 File Offset: 0x00002EF3
		// (set) Token: 0x060000FC RID: 252 RVA: 0x00004CFB File Offset: 0x00002EFB
		public TMP_TextEventHandler.LineSelectionEvent onLineSelection
		{
			get
			{
				return this.m_OnLineSelection;
			}
			set
			{
				this.m_OnLineSelection = value;
			}
		}

		// Token: 0x1700000A RID: 10
		// (get) Token: 0x060000FD RID: 253 RVA: 0x00004D04 File Offset: 0x00002F04
		// (set) Token: 0x060000FE RID: 254 RVA: 0x00004D0C File Offset: 0x00002F0C
		public TMP_TextEventHandler.LinkSelectionEvent onLinkSelection
		{
			get
			{
				return this.m_OnLinkSelection;
			}
			set
			{
				this.m_OnLinkSelection = value;
			}
		}

		// Token: 0x060000FF RID: 255 RVA: 0x00004D18 File Offset: 0x00002F18
		private void Awake()
		{
			this.m_TextComponent = base.gameObject.GetComponent<TMP_Text>();
			if (this.m_TextComponent.GetType() == typeof(TextMeshProUGUI))
			{
				this.m_Canvas = base.gameObject.GetComponentInParent<Canvas>();
				if (this.m_Canvas != null)
				{
					if (this.m_Canvas.renderMode == RenderMode.ScreenSpaceOverlay)
					{
						this.m_Camera = null;
						return;
					}
					this.m_Camera = this.m_Canvas.worldCamera;
					return;
				}
			}
			else
			{
				this.m_Camera = Camera.main;
			}
		}

		// Token: 0x06000100 RID: 256 RVA: 0x00004DA4 File Offset: 0x00002FA4
		private void LateUpdate()
		{
			if (TMP_TextUtilities.IsIntersectingRectTransform(this.m_TextComponent.rectTransform, Input.mousePosition, this.m_Camera))
			{
				int num = TMP_TextUtilities.FindIntersectingCharacter(this.m_TextComponent, Input.mousePosition, this.m_Camera, true);
				if (num != -1 && num != this.m_lastCharIndex)
				{
					this.m_lastCharIndex = num;
					TMP_TextElementType elementType = this.m_TextComponent.textInfo.characterInfo[num].elementType;
					if (elementType == TMP_TextElementType.Character)
					{
						this.SendOnCharacterSelection(this.m_TextComponent.textInfo.characterInfo[num].character, num);
					}
					else if (elementType == TMP_TextElementType.Sprite)
					{
						this.SendOnSpriteSelection(this.m_TextComponent.textInfo.characterInfo[num].character, num);
					}
				}
				int num2 = TMP_TextUtilities.FindIntersectingWord(this.m_TextComponent, Input.mousePosition, this.m_Camera);
				if (num2 != -1 && num2 != this.m_lastWordIndex)
				{
					this.m_lastWordIndex = num2;
					TMP_WordInfo tmp_WordInfo = this.m_TextComponent.textInfo.wordInfo[num2];
					this.SendOnWordSelection(tmp_WordInfo.GetWord(), tmp_WordInfo.firstCharacterIndex, tmp_WordInfo.characterCount);
				}
				int num3 = TMP_TextUtilities.FindIntersectingLine(this.m_TextComponent, Input.mousePosition, this.m_Camera);
				if (num3 != -1 && num3 != this.m_lastLineIndex)
				{
					this.m_lastLineIndex = num3;
					TMP_LineInfo tmp_LineInfo = this.m_TextComponent.textInfo.lineInfo[num3];
					char[] array = new char[tmp_LineInfo.characterCount];
					int num4 = 0;
					while (num4 < tmp_LineInfo.characterCount && num4 < this.m_TextComponent.textInfo.characterInfo.Length)
					{
						array[num4] = this.m_TextComponent.textInfo.characterInfo[num4 + tmp_LineInfo.firstCharacterIndex].character;
						num4++;
					}
					string line = new string(array);
					this.SendOnLineSelection(line, tmp_LineInfo.firstCharacterIndex, tmp_LineInfo.characterCount);
				}
				int num5 = TMP_TextUtilities.FindIntersectingLink(this.m_TextComponent, Input.mousePosition, this.m_Camera);
				if (num5 != -1 && num5 != this.m_selectedLink)
				{
					this.m_selectedLink = num5;
					TMP_LinkInfo tmp_LinkInfo = this.m_TextComponent.textInfo.linkInfo[num5];
					this.SendOnLinkSelection(tmp_LinkInfo.GetLinkID(), tmp_LinkInfo.GetLinkText(), num5);
				}
			}
		}

		// Token: 0x06000101 RID: 257 RVA: 0x00002188 File Offset: 0x00000388
		public void OnPointerEnter(PointerEventData eventData)
		{
		}

		// Token: 0x06000102 RID: 258 RVA: 0x00002188 File Offset: 0x00000388
		public void OnPointerExit(PointerEventData eventData)
		{
		}

		// Token: 0x06000103 RID: 259 RVA: 0x00004FEA File Offset: 0x000031EA
		private void SendOnCharacterSelection(char character, int characterIndex)
		{
			if (this.onCharacterSelection != null)
			{
				this.onCharacterSelection.Invoke(character, characterIndex);
			}
		}

		// Token: 0x06000104 RID: 260 RVA: 0x00005001 File Offset: 0x00003201
		private void SendOnSpriteSelection(char character, int characterIndex)
		{
			if (this.onSpriteSelection != null)
			{
				this.onSpriteSelection.Invoke(character, characterIndex);
			}
		}

		// Token: 0x06000105 RID: 261 RVA: 0x00005018 File Offset: 0x00003218
		private void SendOnWordSelection(string word, int charIndex, int length)
		{
			if (this.onWordSelection != null)
			{
				this.onWordSelection.Invoke(word, charIndex, length);
			}
		}

		// Token: 0x06000106 RID: 262 RVA: 0x00005030 File Offset: 0x00003230
		private void SendOnLineSelection(string line, int charIndex, int length)
		{
			if (this.onLineSelection != null)
			{
				this.onLineSelection.Invoke(line, charIndex, length);
			}
		}

		// Token: 0x06000107 RID: 263 RVA: 0x00005048 File Offset: 0x00003248
		private void SendOnLinkSelection(string linkID, string linkText, int linkIndex)
		{
			if (this.onLinkSelection != null)
			{
				this.onLinkSelection.Invoke(linkID, linkText, linkIndex);
			}
		}

		// Token: 0x040000C8 RID: 200
		[SerializeField]
		private TMP_TextEventHandler.CharacterSelectionEvent m_OnCharacterSelection = new TMP_TextEventHandler.CharacterSelectionEvent();

		// Token: 0x040000C9 RID: 201
		[SerializeField]
		private TMP_TextEventHandler.SpriteSelectionEvent m_OnSpriteSelection = new TMP_TextEventHandler.SpriteSelectionEvent();

		// Token: 0x040000CA RID: 202
		[SerializeField]
		private TMP_TextEventHandler.WordSelectionEvent m_OnWordSelection = new TMP_TextEventHandler.WordSelectionEvent();

		// Token: 0x040000CB RID: 203
		[SerializeField]
		private TMP_TextEventHandler.LineSelectionEvent m_OnLineSelection = new TMP_TextEventHandler.LineSelectionEvent();

		// Token: 0x040000CC RID: 204
		[SerializeField]
		private TMP_TextEventHandler.LinkSelectionEvent m_OnLinkSelection = new TMP_TextEventHandler.LinkSelectionEvent();

		// Token: 0x040000CD RID: 205
		private TMP_Text m_TextComponent;

		// Token: 0x040000CE RID: 206
		private Camera m_Camera;

		// Token: 0x040000CF RID: 207
		private Canvas m_Canvas;

		// Token: 0x040000D0 RID: 208
		private int m_selectedLink = -1;

		// Token: 0x040000D1 RID: 209
		private int m_lastCharIndex = -1;

		// Token: 0x040000D2 RID: 210
		private int m_lastWordIndex = -1;

		// Token: 0x040000D3 RID: 211
		private int m_lastLineIndex = -1;

		// Token: 0x02000062 RID: 98
		[Serializable]
		public class CharacterSelectionEvent : UnityEvent<char, int>
		{
		}

		// Token: 0x02000063 RID: 99
		[Serializable]
		public class SpriteSelectionEvent : UnityEvent<char, int>
		{
		}

		// Token: 0x02000064 RID: 100
		[Serializable]
		public class WordSelectionEvent : UnityEvent<string, int, int>
		{
		}

		// Token: 0x02000065 RID: 101
		[Serializable]
		public class LineSelectionEvent : UnityEvent<string, int, int>
		{
		}

		// Token: 0x02000066 RID: 102
		[Serializable]
		public class LinkSelectionEvent : UnityEvent<string, string, int>
		{
		}
	}
}
